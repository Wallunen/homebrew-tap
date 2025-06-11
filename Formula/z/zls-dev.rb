class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5b93bcd2e9698294ef6108fa99232f378e16f398f3b082c1d18bd45e742209e8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1c8c50a600824bbe76554f5737805c4b7aae3ee2350bf893c8b63a4b9aa2f747" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2e3f1572e7db3fd5510ad53f06a67aad62ba61f8bb9b7d6f09ae3bd543ae36a2" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.15.0-dev.193+fd77d6b9.tar.xz"
  version "0.15.0-dev.193+fd77d6b9"
  license "MIT"
  head "https://github.com/zigtools/zls.git", branch: "master"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on "zig-dev"

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end

  test do
    test_config = testpath/"zls.json"
    test_config.write <<~JSON
      {
        "enable_semantic_tokens": true
      }
    JSON

    json = <<~JSON
      {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "initialize",
        "params": {
          "rootUri": null,
          "capabilities": {}
        }
      }
    JSON

    input = "Content-Length: #{json.size}\r\n\r\n#{json}"
    output = pipe_output("#{bin}/zls --config-path #{test_config}", input, 1)
    assert_match(/^Content-Length: \d+/i, output)

    assert_match version.to_s, shell_output("#{bin}/zls --version")
  end
end
