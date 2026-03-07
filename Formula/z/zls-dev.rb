class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "13c1d9732a3006a7699688c9954cf586591b252a4adb4fb05391ad408afed098" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c2b6dbfd2f3192e22df391e49a28ba8e9acc13a120bdba7c354294866bbd513c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b84ffb5efaa655ecb07b6e0ca82f0c95edfb109941ab9f7a70b2cff289f97927" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.16.0-dev.249+b58f0e2b.tar.xz"
  version "0.16.0-dev.249+b58f0e2b"
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
