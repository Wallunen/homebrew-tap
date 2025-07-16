class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c7d12d61d84982af6bd335fff5dbfcb17a1b799557ec7ad8723f3519c66ce8c2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "90a8a0c9cfebc286a7cdbfdb66d77acc2859a0306db6747556e2ce4100e98eff" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "664afe5d752121f5ee68c571a1fe17335512aeb76be7afaf3d4052f8b390a6e5" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.15.0-dev.293+45b855f7.tar.xz"
  version "0.15.0-dev.293+45b855f7"
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
