class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "55441118e3d99ff36eb7d5f9a161eae95b98c0134961722b30855fb88db7836a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "09da7005a877c6eebe3a5a579ce1bfa00ebf1cc3fa5f7e49f8162a17402bc3eb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "31a0f3bddc31e6e80309a869e5d034e4dca6d065e7c157dd7ffc572960a6173f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3239+d7b93c787.tar.xz"
  version "0.14.0-dev.3239+d7b93c787"
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
