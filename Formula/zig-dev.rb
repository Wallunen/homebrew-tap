class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "86663e72da5d49b81dea45de4ec598e0b31028d1fdcba2f7d96cdc560df6e0cf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2b5747b5d9b7220750e880da21b0cbe9da54d42e766f6824409a70f9d3a12022" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e662a6b10f577d6077854d13946a6636ca04ef802a8b265cf5b32d52d903fa41" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3123+147beec7d.tar.xz"
  version "0.12.0-dev.3123+147beec7d"
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
