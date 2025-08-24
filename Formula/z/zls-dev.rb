class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "46c31838bfef5adcc7fee82428c3ec2b9abbfae38242639afea5f242ee133d93" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "76c7a23190f67e67970024065f689c2c49b3c7b0fc16876fb24ef199fb05fc2a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "508bfe3fd637d2a02f07f3fc7da8900351f407116b03685c5dae26b4f01a30de" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.15.0.tar.xz"
  version "0.15.0"
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
