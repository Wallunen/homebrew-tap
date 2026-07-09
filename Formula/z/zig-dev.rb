class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260709-105408"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "269239286efc1a3999b4f55e79828e89542341ba1e449ebbd3e02cdae8c2f899"
    sha256 cellar: :any_skip_relocation, sequoia:      "f4e1a7be01f817901a6155682ef4531ec068af40867c4c195d6f8185f9e54b9e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "152392b7ee985659cb418d92a24a4ab51e834ea741a1668dbff37390bc1c381c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f8103f2bb178ef4c2bbcae62a5480c2327e7aebd4a6dc01345837645be433cf4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6e25624fd871a76d2604cf7c5ab0984c645b81008607c6ea3d974a3b68405988" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6d81dec0152f6f11f8a12a84a73535b65070fe01b14a1ce75423870d65b3f270" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1282+c0f9b51d8.tar.xz"
  version "0.17.0-dev.1282+c0f9b51d8"
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
