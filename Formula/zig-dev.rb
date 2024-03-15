class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d53f6a53d7d668dc600e2d31251d233c3013f7501fe7cd68d97078dc33d3fd24" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7b447b696e66f65bc685f99227bf4848c8beb4e48ecd219465fa7b7d15dee9a3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c763510db01646b380e85eeb66357218240040b177e18547efc4a306282ed346" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3304+bc5b09469.tar.xz"
  version "0.12.0-dev.3304+bc5b09469"
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
