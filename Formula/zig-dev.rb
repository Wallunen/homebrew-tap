class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "57abdd6f647ffccb2941bf02233002028115260c2f2bc24860fb61682d25ce90" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "29e09b10618d3ebe4a8d1e943ade06127e820ef547bb454aae317db6209f6d2f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6e0d12a7f731854b805189df85f31341ee9a419e0e8d247f7c280d669a05305e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.789+e6590fea1.tar.xz"
  version "0.12.0-dev.789+e6590fea1"
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
