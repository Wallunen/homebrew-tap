class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2a50c54486c7d12acfad4ec1fadb26bad0e6ff850ff05ed8a690f39ef1225281" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3821e9c68df512a8315a0d8c3ae499a1be5880e0c3ae40b515a0b9c044ec5cfe" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e402f4ae463290ab85edc4642fb825562b8b2324943ba443fd42b60968ead18e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1576+5d7fa5513.tar.xz"
  version "0.14.0-dev.1576+5d7fa5513"
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
