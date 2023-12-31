class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6c601fbe46468c281a7411ca475ce4fa22c4fca1e3976105b1c0da5061933606" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "34970cb2e31c692de09958e85157f06d54743432e3a9760f08bb4b87e16d19d5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0f56fb86388d8e82871bf0d87cf2429c72053c0384d07081efdc8b44019c97f9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1861+412999621.tar.xz"
  version "0.12.0-dev.1861+412999621"
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
