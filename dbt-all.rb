class DbtAll < Formula
    include Language::Python::Virtualenv

    desc "Installs dbt core and all adapters"
    version "1.8.1"
    homepage "https://github.com/dbt-labs/dbt-core-bundles"
    url "https://github.com/dbt-labs/dbt-core-bundles/archive/refs/tags/#{version}.tar.gz"
    sha256 "2a646e567c38c4c7e5d42edd589bac4138abef5450c70c741890665e764515b5"

    depends_on "python@3.11"

    @@version = version
    resource "adapters" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/#{DbtAll.class_variable_get(:@@version)}/bundle_core_all_adapters_mac_3.11.zip"
        sha256 "362d931405c58dd6f4b40c0ee71ec1f2aa6116d561c44eda655f30719f6f6fc8"
    end
    resource "requirements" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/#{DbtAll.class_variable_get(:@@version)}/bundle_requirements_mac_3.11.txt"
        sha256 "cd7afbb99ed58ea5c1e93b8594f38d94ccc538cabc123dd0e7559f5fc6fbccd6"
    end

    def install
        venv = virtualenv_create(libexec, "python3", system_site_packages: false, without_pip: false)

        ENV["DBT_PSYCOPG2_NAME"] = "psycopg2"

        requirements_file = "#{buildpath}/bundle_requirements_mac_3.11.txt"
        adapters_path = "#{buildpath}/bundle_pkgs"
        resource("adapters").stage do
            mkdir adapters_path

            Dir.glob("#{Dir.pwd}/*").each do |file|
                mv file, adapters_path
            end
        end
        resource("requirements").stage do
            mv "bundle_requirements_mac_3.11.txt", buildpath
        end

        venv.instance_variable_get(:@formula).system venv.instance_variable_get(:@venv_root)/"bin/pip", "install",
            "-r", requirements_file,
            "--no-index",
            "--no-cache-dir",
            "--ignore-installed",
            "--find-links", adapters_path,
            "--pre"

        ENV.delete("DBT_PSYCOPG2_NAME")
        venv.pip_install_and_link buildpath
        bin.install_symlink "#{libexec}/bin/dbt" => "dbt"
    end

    test do
        assert_match DbtAll.class_variable_get(:@@version), shell_output("#{bin}/dbt --version | awk '/installed:/ {print $3}'")
    end
end