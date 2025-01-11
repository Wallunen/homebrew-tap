class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0057768ff2fbd4484d4e84bc5f79c2382663ae78f8ec634a6bdea1e10c5afa5c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3c5d4cadf8500de687f6a7133e859541aea96c6801960dabf72080235ddad56e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dcf252a76382a6685cfdeb9196bc954172bafe0ae853206718457182ec7c046e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2634+b36ea592b.tar.xz"
  version "0.14.0-dev.2634+b36ea592b"
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
