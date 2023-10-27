class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c45e03249bbf32efbcc1fb6321a85f0d8bf2536be50463847a8a9e98f79c9340" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "be164b6e298edd26963dcf958030169a764ff4aa3da883ce4973ccb75768044e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "698a9ac55af30826aec58e7979ebfa241cd090da1a09be660c3724a8a87bb7ca" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1286+cc394431a.tar.xz"
  version "0.12.0-dev.1286+cc394431a"
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
