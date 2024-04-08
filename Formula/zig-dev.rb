class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c9641b08b9c1d0057d221d25e4804508ef07d9752a3d42fc5601088e8ad165ee" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4b9a563893ea1504b5c17952f9836bfa37fb6cc891169c6209b5360f5d7ad329" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8aa695ec2ca5e4060a8156f550eedfba52ea16ab5e02a1a23602b97c14932335" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3563+129de47a7.tar.xz"
  version "0.12.0-dev.3563+129de47a7"
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
