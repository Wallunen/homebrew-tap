class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "030615acc316e25b3308cbb6bc782cd46fde8b8443de50254fc74adf177bbb65" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1c11a2093e792be7b6f8fbf32615291d5fb2d18075753cf753e3043370a3ee34" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "43d59557c45c2a0587d039a8ab96f0712a79f98808e2d4b9f6eae91796ca63b0" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.16.0-dev.68+a3241acd.tar.xz"
  version "0.16.0-dev.68+a3241acd"
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
