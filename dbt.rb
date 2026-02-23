class Dbt < Formula
  include Language::Python::Virtualenv

  desc "Installs dbt core and the Snowflake adapter"
  version "1.11.6"
  homepage "https://github.com/dbt-labs/dbt-core"
  url "https://files.pythonhosted.org/packages/source/d/dbt-core/dbt_core-1.11.6.tar.gz"
  sha256 "a62cde8f20994589a27cba84bcf63aafbf3ecbd44221137e1b1520cee3baeb5c"

  depends_on "python@3.13"
  depends_on "rust" => :build
  depends_on "maturin" => :build
  depends_on "pkgconf" => :build

  resource "dbt-snowflake" do
    url "https://files.pythonhosted.org/packages/source/d/dbt-snowflake/dbt_snowflake-1.11.2.tar.gz"
    sha256 "9b4ff762821bb72d9b1a9adcd78ddb0d5f4c9edc656dd198053f0971e130ff18"
  end

  resource "agate" do
    url "https://files.pythonhosted.org/packages/29/77/6f5df1c68bf056f5fdefc60ccc616303c6211e71cd6033c830c12735f605/agate-1.9.1.tar.gz"
    sha256 "bc60880c2ee59636a2a80cd8603d63f995be64526abf3cbba12f00767bcd5b3d"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/6b/5c/685e6633917e101e5dcb62b9dd76946cbb57c26e133bae9e0cd36033c0a9/attrs-25.4.0.tar.gz"
    sha256 "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11"
  end

  resource "babel" do
    url "https://files.pythonhosted.org/packages/7d/b2/51899539b6ceeeb420d40ed3cd4b7a40519404f9baf3d4ac99dc413a834b/babel-2.18.0.tar.gz"
    sha256 "b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c5750937c992d"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/e0/2d/a891ca51311197f6ad14a7ef42e2399f36cf2f9bd44752b3dc4eab60fdc5/certifi-2026.1.4.tar.gz"
    sha256 "ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/charset_normalizer-3.4.4.tar.gz"
    sha256 "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  resource "daff" do
    url "https://files.pythonhosted.org/packages/e1/d0/c0a1374db3afad0f9dfe6c795e5df102af03d49ad5e6e8502fb09eb88110/daff-1.4.2.tar.gz"
    sha256 "47f0391eda7e2b5011f7ccac006b9178accb465bcb94a2c9f284257fff5d2686"
  end

  resource "dbt-adapters" do
    url "https://files.pythonhosted.org/packages/a0/f5/a4ce67281ac9fbdf55f4f0bfc8df02487d3aaba323864d0ff432900d582f/dbt_adapters-1.22.6.tar.gz"
    sha256 "c5aecfc09ac92875dbfe483a50e6eb34d9184a818e7b0445d7948cddc9eec972"
  end

  resource "dbt-common" do
    url "https://files.pythonhosted.org/packages/b7/ab/1d49b812472d4f064d715b6968f60f6636624ad18ef8e243055ee74ca5c2/dbt_common-1.37.2.tar.gz"
    sha256 "f83f2b4c1ed234ef38edc6817e0c2bd19f27c653bc1eb8b8411285fe670c2d3c"
  end

  resource "dbt-extractor" do
    url "https://files.pythonhosted.org/packages/f1/06/1f7b5d277af4bd7c3ab5065f79407c46a73950f0879fac69e51067c87649/dbt_extractor-0.6.0.tar.gz"
    sha256 "d6cf08ec793b8bc2bd6e260ef818230ae68a4f71436fa489f08d7db1a52e2ffe"
  end

  resource "dbt-protos" do
    url "https://files.pythonhosted.org/packages/29/67/777aa1c4af897773adb944c2db8d5c2073dd3ae114fa233b5559e900a550/dbt_protos-1.0.431.tar.gz"
    sha256 "8fd3f52f2cb5532874eab93470fec3d9ace74e1ee342eaaf13b24867c042d0ce"
  end

  resource "dbt-semantic-interfaces" do
    url "https://files.pythonhosted.org/packages/b0/91/c702d8fb143541fda10f5eb7a7a89f34bda38ee043ecb3e3653363d0c5a0/dbt_semantic_interfaces-0.9.0.tar.gz"
    sha256 "5c921257dce8bb51c9ffb5479f2bdd959e16ebfb98ee833de6daa70788c47271"
  end

  resource "deepdiff" do
    url "https://files.pythonhosted.org/packages/19/76/36c9aab3d5c19a94091f7c6c6e784efca50d87b124bf026c36e94719f33c/deepdiff-8.6.1.tar.gz"
    sha256 "ec56d7a769ca80891b5200ec7bd41eec300ced91ebcc7797b41eb2b3f3ff643a"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "importlib-metadata" do
    url "https://files.pythonhosted.org/packages/f3/49/3b30cad09e7771a4982d9975a8cbf64f00d4a1ececb53297f1d9a7be1b10/importlib_metadata-8.7.1.tar.gz"
    sha256 "49fef1ae6440c182052f407c8d34a68f72efc36db9ca90dc0113398f2fdde8bb"
  end

  resource "isodate" do
    url "https://files.pythonhosted.org/packages/54/4d/e940025e2ce31a8ce1202635910747e5a87cc3a6a6bb2d00973375014749/isodate-0.7.2.tar.gz"
    sha256 "4cd1aa0f43ca76f4a6c6c0292a85f40b35ec2e43e315b59f06e6d32171a953e6"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/b3/fc/e067678238fa451312d4c62bf6e6cf5ec56375422aee02f9cb5f909b3047/jsonschema-4.26.0.tar.gz"
    sha256 "0c26707e2efad8aa1bfc5b7ce170f3fccc2e4918ff85989ba9ffa9facb2be326"
  end

  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/19/74/a633ee74eb36c44aa6d1095e7cc5569bebf04342ee146178e2d36600708b/jsonschema_specifications-2025.9.1.tar.gz"
    sha256 "b540987f239e745613c7a9176f3edb72b832a4ac465cf02712288397832b5e8d"
  end

  resource "leather" do
    url "https://files.pythonhosted.org/packages/9e/09/849cf129d7eae1e42f873f2dbd60323267c738390b686a7384fb3fb289ad/leather-0.4.1.tar.gz"
    sha256 "67119c2aee93be821f077193bd8534e296c05b38bd174d9c5a80c4aa31d1a4d3"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7/markupsafe-3.0.3.tar.gz"
    sha256 "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
  end

  resource "mashumaro" do
    url "https://files.pythonhosted.org/packages/eb/47/0a450b281bef2d7e97ec02c8e1168d821e283f58e02e6c403b2bb4d73c1c/mashumaro-3.14.tar.gz"
    sha256 "5ef6f2b963892cbe9a4ceb3441dfbea37f8c3412523f25d42e9b3a7186555f1d"
  end

  resource "more-itertools" do
    url "https://files.pythonhosted.org/packages/ea/5d/38b681d3fce7a266dd9ab73c66959406d565b3e85f21d5e66e1181d93721/more_itertools-10.8.0.tar.gz"
    sha256 "f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c67503f13ba30bd"
  end

  resource "msgpack" do
    url "https://files.pythonhosted.org/packages/4d/f2/bfb55a6236ed8725a96b0aa3acbd0ec17588e6a2c3b62a93eb513ed8783f/msgpack-1.1.2.tar.gz"
    sha256 "3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512/networkx-3.6.1.tar.gz"
    sha256 "26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509"
  end

  resource "orderly-set" do
    url "https://files.pythonhosted.org/packages/4a/88/39c83c35d5e97cc203e9e77a4f93bf87ec89cf6a22ac4818fdcc65d66584/orderly_set-5.5.0.tar.gz"
    sha256 "e87185c8e4d8afa64e7f8160ee2c542a475b738bc891dc3f58102e654125e6ce"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/65/ee/299d360cdc32edc7d2cf530f3accf79c4fca01e96ffc950d8a52213bd8e4/packaging-26.0.tar.gz"
    sha256 "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
  end

  resource "parsedatetime" do
    url "https://files.pythonhosted.org/packages/a8/20/cb587f6672dbe585d101f590c3871d16e7aec5a576a1694997a3777312ac/parsedatetime-2.6.tar.gz"
    sha256 "4cb368fbb18a0b7231f4d76119165451c8d2e35951455dfee97c62a87b04d455"
  end

  resource "pathspec" do
    url "https://files.pythonhosted.org/packages/ca/bc/f35b8446f4531a7cb215605d100cd88b7ac6f44ab3fc94870c120ab3adbf/pathspec-0.12.1.tar.gz"
    sha256 "a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacaef9a838c4e29f5712"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/ba/25/7c72c307aafc96fa87062aa6291d9f7c94836e43214d43722e86037aac02/protobuf-6.33.5.tar.gz"
    sha256 "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/69/44/36f1a6e523abc58ae5f928898e4aca2e0ea509b5aa6f6f392a5d882be928/pydantic-2.12.5.tar.gz"
    sha256 "4d351024c75c0f085a9febbb665ce8c0c6ec5d30e903bdb6394b7ede26aebb49"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/71/70/23b021c950c2addd24ec408e9ab05d59b035b39d97cdc1130e1bce647bb6/pydantic_core-2.41.5.tar.gz"
    sha256 "08daa51ea16ad373ffd5e7606252cc32f07bc72b28284b6bc9c6df804816476e"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "python-slugify" do
    url "https://files.pythonhosted.org/packages/87/c7/5e1547c44e31da50a460df93af11a535ace568ef89d7a811069ead340c4a/python-slugify-8.0.4.tar.gz"
    sha256 "59202371d1d05b54a9e7720c5e038f928f45daaffe41dd10822f3907b937c856"
  end

  resource "pytimeparse" do
    url "https://files.pythonhosted.org/packages/37/5d/231f5f33c81e09682708fb323f9e4041408d8223e2f0fb9742843328778f/pytimeparse-1.1.8.tar.gz"
    sha256 "e86136477be924d7e670646a98561957e8ca7308d44841e21f5ddea757556a0a"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/f8/bf/abbd3cdfb8fbc7fb3d4d38d320f2441b1e7cbe29be4f23797b4a2b5d8aac/pytz-2025.2.tar.gz"
    sha256 "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "referencing" do
    url "https://files.pythonhosted.org/packages/22/f5/df4e9027acead3ecc63e50fe1e36aca1523e1719559c499951bb4b53188f/referencing-0.37.0.tar.gz"
    sha256 "44aefc3142c5b842538163acb373e24cce6632bd54bdb01b21ad5863489f50d8"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "rpds-py" do
    url "https://files.pythonhosted.org/packages/20/af/3f2f423103f1113b36230496629986e0ef7e199d2aa8392452b484b38ced/rpds_py-0.30.0.tar.gz"
    sha256 "dd8ff7cf90014af0c0f787eea34794ebf6415242ee1d6fa91eaba725cc441e84"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "snowplow-tracker" do
    url "https://files.pythonhosted.org/packages/ff/77/1ab6e5bafb9c80d8128f065a355377a04ac5b3c38eb719d920a9909d346e/snowplow_tracker-1.1.0.tar.gz"
    sha256 "95d8fdc8bd542fd12a0b9a076852239cbaf0599eda8721deaf5f93f7138fe755"
  end

  resource "sqlparse" do
    url "https://files.pythonhosted.org/packages/18/67/701f86b28d63b2086de47c942eccf8ca2208b3be69715a1119a4e384415a/sqlparse-0.5.4.tar.gz"
    sha256 "4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e"
  end

  resource "text-unidecode" do
    url "https://files.pythonhosted.org/packages/ab/e2/e9a00f0ccb71718418230718b3d900e71a5d16e701a3dae079a21e9cd8f8/text-unidecode-1.3.tar.gz"
    sha256 "bad6603bb14d279193107714b288be206cac565dfa49aa5b105294dd5c4aab93"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655/typing_inspection-0.4.2.tar.gz"
    sha256 "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
  end

  resource "zipp" do
    url "https://files.pythonhosted.org/packages/e3/02/0f2892c661036d50ede074e376733dca2ae7c6eb617489437771209d4180/zipp-3.23.0.tar.gz"
    sha256 "a07157588a12518c9d4034df3fbbee09c814741a33ff63c05fa29d26a2404166"
  end

  resource "asn1crypto" do
    url "https://files.pythonhosted.org/packages/de/cf/d547feed25b5244fcb9392e288ff9fdc3280b10260362fc45d37a798a6ee/asn1crypto-1.5.1.tar.gz"
    sha256 "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c"
  end

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/4f/53/2e0a325e080bd83f5dfd8f964b70b93badc284bcb5680bee75327771ad4a/boto3-1.42.54.tar.gz"
    sha256 "fe3d8ec586c39a0c96327fd317c77ca601ec5f991e9ba7211cacae8db4c07a73"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/be/9a/5ab14330e5d1c3489e91f32f6ece40f3b58cf82d2aafe1e4a61711f616b0/botocore-1.42.54.tar.gz"
    sha256 "ab203d4e57d22913c8386a695d048e003b7508a8a4a7a46c9ddf4ebd67a20b69"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/60/04/ee2a9e8542e4fa2773b81771ff8349ff19cdd56b7258a0cc442639052edb/cryptography-46.0.5.tar.gz"
    sha256 "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
  end

  resource "filelock" do
    url "https://files.pythonhosted.org/packages/73/92/a8e2479937ff39185d20dd6a851c1a63e55849e447a55e798cc2e1f49c65/filelock-3.24.3.tar.gz"
    sha256 "011a5644dc937c22699943ebbfc46e969cdde3e171470a6e40b9533e5a72affa"
  end

  resource "jaraco-classes" do
    url "https://files.pythonhosted.org/packages/06/c0/ed4a27bc5571b99e3cff68f8a9fa5b56ff7df1c2251cc715a652ddd26402/jaraco.classes-3.4.0.tar.gz"
    sha256 "47a024b51d0239c0dd8c8540c6c7f484be3b8fcf0b2d85c13825780d3b3f3acd"
  end

  resource "jaraco-context" do
    url "https://files.pythonhosted.org/packages/cb/9c/a788f5bb29c61e456b8ee52ce76dbdd32fd72cd73dd67bc95f42c7a8d13c/jaraco_context-6.1.0.tar.gz"
    sha256 "129a341b0a85a7db7879e22acd66902fda67882db771754574338898b2d5d86f"
  end

  resource "jaraco-functools" do
    url "https://files.pythonhosted.org/packages/0f/27/056e0638a86749374d6f57d0b0db39f29509cce9313cf91bdc0ac4d91084/jaraco_functools-4.4.0.tar.gz"
    sha256 "da21933b0417b89515562656547a77b4931f98176eb173644c0d35032a33d6bb"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/d3/59/322338183ecda247fb5d1763a6cbe46eff7222eaeebafd9fa65d4bf5cb11/jmespath-1.1.0.tar.gz"
    sha256 "472c87d80f36026ae83c6ddd0f1d05d4e510134ed462851fd5f754c8c3cbb88d"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/43/4b/674af6ef2f97d56f0ab5153bf0bfa28ccb6c3ed4d1babf4305449668807b/keyring-25.7.0.tar.gz"
    sha256 "fe01bd85eb3f8fb3dd0405defdeac9a5b4f6f0439edbb3149577f244a2e8245b"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/1b/04/fea538adf7dbbd6d186f551d595961e564a3b6715bdf276b477460858672/platformdirs-4.9.2.tar.gz"
    sha256 "9a33809944b9db043ad67ca0db94b14bf452cc6aeaac46a88ea55b26e2e9d291"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/5c/5a/b46fa56bf322901eee5b0454a34343cdbdae202cd421775a8ee4e42fd519/pyjwt-2.11.0.tar.gz"
    sha256 "35f95c1f0fbe5d5ba6e43f00271c275f7a1a4db1dab27bf708073b75318ea623"
  end

  resource "pyopenssl" do
    url "https://files.pythonhosted.org/packages/80/be/97b83a464498a79103036bc74d1038df4a7ef0e402cfaf4d5e113fb14759/pyopenssl-25.3.0.tar.gz"
    sha256 "c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/05/04/74127fc843314818edfa81b5540e26dd537353b123a4edc563109d8f17dd/s3transfer-0.16.0.tar.gz"
    sha256 "8e990f13268025792229cd52fa10cb7163744bf56e719e0b9cb925ab79abf920"
  end

  resource "snowflake-connector-python" do
    on_macos do
        on_arm do
            url "https://files.pythonhosted.org/packages/e6/7a/eda732425c713e07d7327f0c98473615814365e1a75c8d67c31c43ed2fa9/snowflake_connector_python-4.3.0-cp313-cp313-macosx_11_0_arm64.whl"
            sha256 "e42dd9af46fa3ad0e61c1aa6a227357cace481916797ecb92dbb14adb61931e1"
        end
        on_intel do
            url "https://files.pythonhosted.org/packages/92/40/9ba14e500d1d92f12f0dac8d5b975606f0f15bee69c4ceadba64a8853b16/snowflake_connector_python-4.3.0-cp313-cp313-macosx_11_0_x86_64.whl"
            sha256 "e96aaf23f2b021e0d2aac8ac1b541975cd1f6896d9115eefe0938114e694a562"
        end
    end
  end

  resource "sortedcontainers" do
    url "https://files.pythonhosted.org/packages/e8/c4/ba2f8066cceb6f23394729afe52f3bf7adec04bf9ed2c820b39e19299111/sortedcontainers-2.4.0.tar.gz"
    sha256 "25caa5a06cc30b6b83d11423433f65d1f9d76c4c6a0c90e3379eaa43b9bfdb88"
  end

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a/tomlkit-0.14.0.tar.gz"
    sha256 "cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")
    vpy  = venv.root/"bin/python"

    # Ensure pip exists inside the venv (Homebrew venvs are often created without pip)
    system vpy, "-m", "ensurepip"
    system vpy, "-m", "pip", "install", "--upgrade", "pip", "setuptools", "wheel"

    resources.each do |r|
      ohai "Installing Python resource: #{r.name}"

      if r.url.to_s.end_with?(".whl")
        wheel_src  = r.cached_download
        wheel_name = wheel_src.basename.to_s.sub(/\A[0-9a-f]{64}--/, "")
        wheel_dst  = buildpath/wheel_name
        cp wheel_src, wheel_dst

        system vpy, "-m", "pip", "install", "--no-deps", wheel_dst
      else
        r.stage do
          system vpy, "-m", "pip", "install", "--no-deps", "."
        end
      end
    end

    ohai "Installing Python package: #{name}"
    system vpy, "-m", "pip", "install", "--no-deps", buildpath

    # Make sure brew can link dbt (this creates prefix/bin/dbt -> libexec/bin/dbt)
    bin.install_symlink libexec/"bin/dbt"
  end

  test do
    out = shell_output("#{bin}/dbt --version")
    assert_match "Core:", out
    assert_match(/snowflake/i, out)
  end
end