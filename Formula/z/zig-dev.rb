class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f312591c073f54df2737db547f97c16ca55bcda263008f0cbdfacfd1cd131b07" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eea72eec1f854394dc998edb8ef2b509afe924cb05d2745ae027993cc9116824" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "547cff1c77a4dfd8b5ba54c756ca4e5e328c42fbe1b7ce7edfc35fd9794e75c8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3223+13ad984b1.tar.xz"
  version "0.14.0-dev.3223+13ad984b1"
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
