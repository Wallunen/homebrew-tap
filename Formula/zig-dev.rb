class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a0f1d29a523e3d1b0417bb76eaa6ad846eea21d9d9adbf661342a5cb0bb798c7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0e1a6d3214f2c07febca2156f57d58277ddd0ce066040a00ef053a27d362eb24" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "673c13d27e024d7403d15d800a57f7e97c4fec81c20421dcf23db18c7ecbcafb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1297+a9e66ed73.tar.xz"
  version "0.12.0-dev.1297+a9e66ed73"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
