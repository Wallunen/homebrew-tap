class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b54c5ceb704809e2f0156ecfc3cf7edcb8c2d4bb81551dcbd2bf1e14f9e086f0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f0b0589ecc62a63e794b15727ea087d8cc6a99cb831699a795e48346fd70d0d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9ec921a97f99f2fdde06952a6aa9174ece410434c0ed29d5ec74ebee73ac0a40" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3336+6c2f37455.tar.xz"
  version "0.11.0-dev.3336+6c2f37455"
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
