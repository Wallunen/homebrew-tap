class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "506384c190afc79e49e993ec2a5de21a694a67e9f2e049753beab7e772e37658" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f1ba10564e056aaa55d211585567546082eaa899b98ca584badeb9a7acc94cbe" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bb02e633f5faf66230b1f512b7669aa148de09492bd5e34e85ee9b7874fe791f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2461+fde05b10b.tar.xz"
  version "0.11.0-dev.2461+fde05b10b"
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
