class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ace224bff6a0e516d661dcc912b4b70d1d57dfc00d38c867fa8ae189f9cccce3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "21b5ad3144a2683e9b6af06187509b1eca9eafe23be7d8cac85d6640eaa9dbaa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "16df4d0fc546c0fffd859bb2c84297a11a4aa654cf72b9c47850a6090f31f66a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3934+ba6e5e65a.tar.xz"
  version "0.11.0-dev.3934+ba6e5e65a"
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
