class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "846347c9ad56f38156f1cf37d7ffd9590c18475187eff4bbeb18c61a761d98bb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8d23a26c8c86c8ac8e23e6ab3dc0082ae08c9ead96fa2b3b59550e80b4250dd9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4f0670f8e689a4eeac23e262f748b1d94e5bd49db4f0979b802d0c0340e3b20a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3156+0b2e23b06.tar.xz"
  version "0.12.0-dev.3156+0b2e23b06"
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
