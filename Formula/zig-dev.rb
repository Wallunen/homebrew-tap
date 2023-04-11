class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4bc1f1c28637b49b4ececdc819fc3d1a5d593560b8667183f26fe861b816279b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6f9aabd01d5200fe419e5fa54846e67f8342bf4cbebb71f735a729f4daaf4190" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b0895fe5d83dd361bd268580c9de5d5a3c42eaf966ea049bfae93eb537a88633" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2545+311d50f9d.tar.xz"
  version "0.11.0-dev.2545+311d50f9d"
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
