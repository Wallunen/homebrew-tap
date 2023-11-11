class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dee83b87a18a2b9848b9bb11f6d5a480887da48482ae463ab48064261b10c9f7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "54bcc12859d18588215def8d2b4bd8cea8aa5978ad916edabff35ae64a55fc97" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "416da7d24a73191e77a3a1b6af645f58769e7cf5b729a3dfa57d42a79723f951" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1578+138a35df8.tar.xz"
  version "0.12.0-dev.1578+138a35df8"
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
