class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260503-164150"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5cb5c3a22d09e668d84fef70fab5318a3c7b42dd6ed6e6e3eeb12a0400904d1a"
    sha256 cellar: :any_skip_relocation, sequoia:      "2a326aebbd56cac5d69288475c134680751f2bc44b4830d0f2925c865e3096cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5db27c00c23ecb18340e051c37318137fd6348b590b23d806ba1edf76b79c784"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4f4ea4a19141294b4f257b5179cd7513a90a005219a9cf9475526e1c20bfda6c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1156443649e59f291de2e814ff11cdd75563955947d1f2faa7739d0167345957" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f478c5c58c743be6004a9b9675849fbc0de6483431e06090addbd1d739add7b3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.248+95507faf1.tar.xz"
  version "0.17.0-dev.248+95507faf1"
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
