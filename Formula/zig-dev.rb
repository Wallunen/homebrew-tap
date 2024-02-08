class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "071b5e06e810fbd8d4e045cece56cd0299c79ca93a3988c968591a31d574ba68" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b5f0f0fd82a48dd177309b862242df7a25f99a2fbfad4870a8c359000af597d7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6e9ac4e16c5a66f7d8f026ecc6b56a10e170210c0aea67dd0beec7e903cf61fc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2638+38c2a2573.tar.xz"
  version "0.12.0-dev.2638+38c2a2573"
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
