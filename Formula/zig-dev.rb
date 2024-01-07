class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1d40ebfec0e72db3fa666e9a997841fd96a704e3b1fc84391dfd7366bf443899" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "46d0fe89a0357b9f54ea5b15526db04926a9209b871b6d0abd4c7da1cc65acee" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4c450d5817da7914b27be2147f9740ebdf186cc933ae87ddb2a8eaa130d02d57" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2063+804cee3b9.tar.xz"
  version "0.12.0-dev.2063+804cee3b9"
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
