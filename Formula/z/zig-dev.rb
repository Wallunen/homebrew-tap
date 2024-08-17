class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b202b88ac0093e0f46b83c4377903db4129287809b89527186b24fe6dd80efec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "13291d2dfe1f8663270a6d7d8b9ad2c56d433d489b20b1570ce3ed5c7df0ab83" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6afd902f380a79c27d2903bc98b10ce23e007bb57323d8e5cce95387c7dd4411" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1158+90989be0e.tar.xz"
  version "0.14.0-dev.1158+90989be0e"
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
