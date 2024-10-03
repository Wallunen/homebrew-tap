class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ea8a4384b78d2064137552af055e7e2916789f5be2d7de39503afedf932706d4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "731b76ebc03474f38b906db556716a669a73eb8bf512c0053dfb6e3bc8ea5020" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "98e534c84c786f28ce31936c015df5cd9b0a4725185c2dc43ee0056d6dc778ce" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1702+26d35cc11.tar.xz"
  version "0.14.0-dev.1702+26d35cc11"
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
