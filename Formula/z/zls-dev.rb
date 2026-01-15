class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8f7c6dc064c2e30bf00de4dea38054529fea4b683ecb90ad6280f1515c391fc6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bbfb2c8b168fb40d21c1c20fde9f96a5ab2938a3641b4d014dfd949d80be6a01" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ee0e35cf206abeecd4304abe448b5cb8d42af4ed9ac7a2b8d6beb1d3bac2afb0" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.16.0-dev.130+ea5418b1.tar.xz"
  version "0.16.0-dev.130+ea5418b1"
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
