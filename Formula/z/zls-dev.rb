class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2f53e6389dd2c8478c496a584baf2048ec68a853946a3aa89a2f543f18a60fcf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e7f0194af354083a78cac830d8b61e51c54e04e1f6b736f2af472b0b613e4a7b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4b68227f7554f02bf7a04445991d8dc5fa5b21c94a4b325148e66773112bec86" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.16.0-dev.250+6946f114.tar.xz"
  version "0.16.0-dev.250+6946f114"
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
