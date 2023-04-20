class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "574c7614742816fe5c929be49bef5549eaddc96d2d4ba006eb76eac6ee7d6a00" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8b67c2e1df817c44544da5a7056dbb182863b38f37eb2e6c9a9a865fbf63ec33" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "053965b4613350a701e07f739230ea5826cfb2cf789194f288dec1e008638e4b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2680+a1aa55ebe.tar.xz"
  version "0.11.0-dev.2680+a1aa55ebe"
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
