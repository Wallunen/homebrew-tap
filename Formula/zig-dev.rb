class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cda34db636fc9291327567e054f601f7a8e0edc33aeff2c8cdc31f76fda03d74" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2d85359fce6e642c7468c7ff05bb7beff5708e065c230463be0321b1b375f934" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a823dbbbd461a880dfb5b8114769f965467080ad6c072a686c3075ad6f650b7d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3664+0f5aff344.tar.xz"
  version "0.11.0-dev.3664+0f5aff344"
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
