class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a6b1f3101e5f44b8443214ebd064b8bc183ed8b1e331a17db14c075dc19d1556" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6aadac15a1edcca4eef851f4d2963a3eadbca7c9acc3377be9a7f8a34bc182fa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "026751bfd3fecb3cd5b35a36ef0ff7a3db8cbd7de5f34f79f4dd49db9d1e318f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1684+ea4a07701.tar.xz"
  version "0.12.0-dev.1684+ea4a07701"
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
