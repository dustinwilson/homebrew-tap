class DbtAll < Formula
    include Language::Python::Virtualenv

    desc "Installs dbt core and all adapters"
    version "1.8.4"
    homepage "https://github.com/dbt-labs/dbt-core-bundles"
    url "https://github.com/dbt-labs/dbt-core-bundles/archive/refs/tags/1.8.4.tar.gz"
    sha256 "61a84ce94288d6436952a73fadb6194b2d643b9e32430905aeec8d43a03ec63e"

    depends_on "python@3.11"

    resource "adapters" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/1.8.4/bundle_core_all_adapters_mac_3.11.zip"
        sha256 "5f6cdc5d2dce5dd63c703e29ac08ba88c1e8013942c6c4338febfcfcd2bd0209"
    end
    resource "requirements" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/1.8.4/bundle_requirements_mac_3.11.txt"
        sha256 "f80f9c3f47347abfc926a5dbc435b520acaf4d791e90435316c04aa6b5d726f2"
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
        assert_match "1.8.1", shell_output("#{bin}/dbt --version | awk '/installed:/ {print $3}'")
    end
end