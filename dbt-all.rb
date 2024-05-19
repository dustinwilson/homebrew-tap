class DbtAll < Formula
    include Language::Python::Virtualenv

    desc "Installs dbt core and all adapters"
    version "1.8.0"
    homepage "https://github.com/dbt-labs/dbt-core-bundles"
    url "https://github.com/dbt-labs/dbt-core-bundles/archive/refs/tags/#{version}.tar.gz"
    sha256 "8183a9a9df032247ea8c39bca689a0dce1a434f61003b35aec82ae89d9fb034a"

    depends_on "python@3.11"

    @@version = version
    resource "adapters" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/#{DbtAll.class_variable_get(:@@version)}/bundle_core_all_adapters_mac_3.11.zip"
        sha256 "66631b63871fc47759c93bcda61978c02d228a83f540ba5736eda0acd7c876d0"
    end
    resource "requirements" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/#{DbtAll.class_variable_get(:@@version)}/bundle_requirements_mac_3.11.txt"
        sha256 "8c5d08d0bcad7bf687eae13c434e496255bd98dd3e5917ac61e9c2ea329852f5"
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
        assert_match "dbt", shell_output("#{bin}/dbt --version | awk '/installed:/ {print $3}'")
    end
end