class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b1bae2b881f1df7505bae0828290c8319c49d0e89b8400b3b7f3101d4f5e297f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7c91b62cd01fc7b6be8cb7abf212232950881a48322c4d0b43f1cf6673aaa21b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6c37b030db7a9a3c6a6f83048a3452ca5d725ca7cf603a1849323e40ea1fee86" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.14.0-dev.395+43bece5.tar.xz"
  version "0.14.0-dev.395+43bece5"
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
