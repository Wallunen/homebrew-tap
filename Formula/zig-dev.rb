class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "17ae48ac346c3324bc167738a2b5e2925c8397fa5632cf9e169613b3dbb812cc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a008049f77d49a69710dd1d72a18bc82fd6609818cf1dd13ee981ba299edf8cd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "18dbbd9dda53ee278cccceebda08a6ca9c66c990a23c9ebc3de31562b8ead323" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3247+26e895e3d.tar.xz"
  version "0.12.0-dev.3247+26e895e3d"
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
