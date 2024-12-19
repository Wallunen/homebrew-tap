class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2cf5b69495be83524a20fbcfa4bf78b1cbf6019be927af773fc50102212edc68" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "aa3b9d80bb1fde2454ad0fd0761d7c1cb18ef1b13d62df9809f8d2100f5d9185" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "73f2fb9491106a302234529b9d9e36ab54e3d06aa3c238145f96e2849fb829c0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2540+f857bf72e.tar.xz"
  version "0.14.0-dev.2540+f857bf72e"
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
