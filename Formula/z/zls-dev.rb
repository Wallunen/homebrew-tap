class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "50c005d84bb5bbbe860dfc98c8e823389450a9326a1515a17bc40e87b49fc68a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d04606793cbf5f85f53b94c80244494a002723850c715f0d9e707dac8b049617" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e394cfc3b8b65e20b8c593b7d975a8ff7cf8aca7e8a8da86cac1d7fe62ba3e09" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.15.0-dev.354+c470affb.tar.xz"
  version "0.15.0-dev.354+c470affb"
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
