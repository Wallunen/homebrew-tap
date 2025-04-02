class ZlsDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "36ed8f9c8ba8ad22dae49b4dda00296ff5c40c91d3bdf1b6bdf5ec1165c4a90c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "28b2bd409eb42c0dff9118302bf40058b8c982eac1b6d1db4b24b3444300bde2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e4e39220a5898312b249ac2cdc3aa69ebe8d64c4c1501d32cd62efe82192cdcf" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{os}-#{arch}-0.15.0-dev.17+b30d4de.tar.xz"
  version "0.15.0-dev.17+b30d4de"
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
