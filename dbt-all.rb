class DbtAll < Formula
    include Language::Python::Virtualenv

    desc "Installs dbt core and all adapters"
    version "1.8.23"
    homepage "https://github.com/dbt-labs/dbt-core-bundles"
    url "https://github.com/dbt-labs/dbt-core-bundles/archive/refs/tags/1.8.23.tar.gz"
    sha256 "5f175ade40a0d95f659d3232f201423f1d3a7637e10f1190e8dbee7110ce8a61"

    depends_on "python@3.11"

    resource "adapters" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/1.8.23/bundle_core_all_adapters_mac_3.11.zip"
        sha256 "0b8eb7367a105068ccaea9cda07316fe44bdceb28ae9eb093e116de2a8c4b2a6"
    end
    resource "requirements" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/1.8.23/bundle_requirements_mac_3.11.txt"
        sha256 "14973286d20565e203e7f469228c7f44120c1cb5f518f538f410aee9c5893546"
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

        # Other packages are built using numpy<2 so dbt errors because of version mismatch
        venv.instance_variable_get(:@formula).system venv.instance_variable_get(:@venv_root)/"bin/pip", "install", "numpy<2.0"

        ENV.delete("DBT_PSYCOPG2_NAME")
        venv.pip_install_and_link buildpath
        bin.install_symlink "#{libexec}/bin/dbt" => "dbt"
    end

    test do
        assert_match "1.8.7", shell_output("#{bin}/dbt --version | awk '/installed:/ {print $3}'")
    end
end
