class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e380f8c8d51faf9a400dbdaefa5edce5060e01b34a33bcd14ba6291a6fc0357a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ec7f216278dc0f4ab67b5ec95489abac266c90e9ed174a44b6b799297a3bd085" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e0832c05006e43cbae383f85cd20119d7d838d8c8286a5cd0e3d2820b5c72c1c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3146+671c2acf4.tar.xz"
  version "0.12.0-dev.3146+671c2acf4"
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
