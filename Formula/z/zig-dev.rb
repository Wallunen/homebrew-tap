class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260504-172536"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "35a5b75d5fa0cdca8d228a807194025f9d262fa430fc22280ac4f53cc6109d53"
    sha256 cellar: :any_skip_relocation, sequoia:      "19ade0eed46cd9a8401fb218cb4d16e4c284282beff789684a019fd988e6c060"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b6d4a103dce688ad63bd542b2d7b67651873f57e3d6f188a1fde4a45363372e"
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
