class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ac240b8367374ad690c242bd4be846bfc8da88af2192d1fb9f86ec601db52338" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0b5f556b6f08702d477e878c19ed8e26b4c0282006a192a83a058a81621caa2a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5e7e7c0138f3f14348b87d007b7c3cbd3c14e3ea19a94658ed3bc1b69e6e0e16" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2922+774487038.tar.xz"
  version "0.12.0-dev.2922+774487038"
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
