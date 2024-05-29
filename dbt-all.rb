class DbtAll < Formula
    include Language::Python::Virtualenv

    desc "Installs dbt core and all adapters"
    version "1.8.3"
    homepage "https://github.com/dbt-labs/dbt-core-bundles"
    url "https://github.com/dbt-labs/dbt-core-bundles/archive/refs/tags/1.8.3.tar.gz"
    sha256 "611727813ff4ff7525c021ab33b209d4724d344a4bb72738bcebd69888aad961"

    depends_on "python@3.11"

    resource "adapters" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/1.8.3/bundle_core_all_adapters_mac_3.11.zip"
        sha256 "d82fec6a1e8522f5470f628ce462a3f059f7544de94cfad8d677d7a51074bf95"
    end
    resource "requirements" do
        url "https://github.com/dbt-labs/dbt-core-bundles/releases/download/1.8.3/bundle_requirements_mac_3.11.txt"
        sha256 "04ddd9c2ae2f6365be5dccd5d5a0a5c022195e9cfdc074d016a5032124699dc1"
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