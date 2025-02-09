class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "49147fc94ab6cf65dc8445170f79ce067e7e2002fa6e6597953c91b9ab1e8f19" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3a90e7027a04ccd5ed62d928d2f580b1d7d7fae6d204ce7de0e748c0bf1310c3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ed621473f5872508609ad0292d83da95511b50683c77b0bf3479f4a394b53c82" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3091+42e48b83b.tar.xz"
  version "0.14.0-dev.3091+42e48b83b"
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
