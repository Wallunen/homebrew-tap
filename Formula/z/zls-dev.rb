class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cd4d4078961ac75c7035da760c8c7c04e42e9afa9cc46b29149a5c5ed5dde0aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "37601e8e3187f4f0de5f99481e570354440ab2194438cd127983dbe12dd291b5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "974ccf1ab821d125fee9d3d1d1eac5e680b9ee6e792beb8b61110971c9deb2ef" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.16.0-dev.151+246f9387.tar.xz"
  version "0.16.0-dev.151+246f9387"
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
