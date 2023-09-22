class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "78015ae2be1b47c0017901dafac5fcb5a47f27920262a3212138041add9ea403" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e98ab6b93a239c5d8b5c7bfe566ce034967bda257247c3cf07065488c05e5fb0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "827f347a3c2bdc918ea169a3ab9d44f2e06c79846a154bd7eb4a30f01b22465e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.467+0345d7866.tar.xz"
  version "0.12.0-dev.467+0345d7866"
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
