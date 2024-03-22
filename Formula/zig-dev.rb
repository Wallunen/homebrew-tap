class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "38e15f30e2e0ed4615d89dacb7d3a9d1a23f4bc40d289bcb115cfd646da545df" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "01044e7fa24c6c8da2fb933eaa3bf4d085bad741ef368131a6fcb909f3470cf9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "16ca9cbf3b6a8dafdf387254ea4d4ffa68610144243fee4beca6b316226d9958" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3405+31791ae15.tar.xz"
  version "0.12.0-dev.3405+31791ae15"
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
