class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0a55d24e60be210c2099d9595bb86e9359e18b8455a926670ff3dfb5f0209eb7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9ccb6e4808d1ff589bf8aa1b7739f3c75cc19bc8467ae1a208e8ee47a0cafaa1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f18f286f5c093f766b153b6542d27ddcddecf0baa7917450b533a1bd5a4ecfa7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1935+1d96a17af.tar.xz"
  version "0.11.0-dev.1935+1d96a17af"
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
