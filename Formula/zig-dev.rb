class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7da92f89d4fa1afeaa50c9d424565af67526937bebf59c27584cea60487f7f60" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dc2869df07832879e3c610cc885d0e6a5ccd595e78c6b86fec535a9eba2b5740" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9f3468b1baf945ebdb08b94b1490c97a656762e6815cd2084c4fa7bb5e6d69ab" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2811+3cafb9655.tar.xz"
  version "0.12.0-dev.2811+3cafb9655"
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
