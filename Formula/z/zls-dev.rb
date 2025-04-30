class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4f061226ec4bf8f6eacf2611a0f0063bf2d5327bb93fb1ff2e2656c0826e0399" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b389e4a51d2db7050bee415669e5d174bd41d88c8bc39cf9d40203eca2bf3675" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6e1d1b3e4d11a0a36e3fecef1e4bc4db66355fe3a3dabec1dbd4de3b32c96c9d" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.15.0-dev.80+d8b73b11.tar.xz"
  version "0.15.0-dev.80+d8b73b11"
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
