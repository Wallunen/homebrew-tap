class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aed907b4e63ff4a5a35fee339f9736b20fecfe9b6884f53df6a46d8c1ac57615" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5dc5c7c59d37251ab407dbe34d2e21a77db6ce331a97a6c7932dacbc452c9bd4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8a82c23525f80733773f5118bf5fd66bc8d7fe0daca3c063f64f4759b77c823a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3079+a1b083b66.tar.xz"
  version "0.12.0-dev.3079+a1b083b66"
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
