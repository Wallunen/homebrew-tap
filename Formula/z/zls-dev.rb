class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aca1f8898d88e33d0cf6cbd0a50f88964bf3901d003213ddd5fbc2b64a056600" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a7e444b5b2c0492b19e13fb169fcdcaf0326b31938e353b10e5b08e5f1d1a9de" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d6ae1611f487688a7dabac6dabe8cd3b4407376daf1357b56db1f8398cd096f2" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.14.0-dev.390+188a4c0.tar.xz"
  version "0.14.0-dev.390+188a4c0"
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
